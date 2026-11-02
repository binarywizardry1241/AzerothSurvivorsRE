//! Current-target body_frame 140a030e0 and projection 140a6b970.

use bevy::camera::{CameraProjection, Projection, SubCameraView};
use bevy::math::Vec3A;
use bevy::prelude::*;

#[derive(Clone, Copy)]
pub(super) struct BodyFrame {
    camera: benilla_formats::M2PortraitCamera,
    authored: bool,
}

impl BodyFrame {
    pub fn from_m2(bytes: &[u8]) -> Result<Self, String> {
        let camera = benilla_formats::parse_m2_camera(bytes, 1);
        let authored = camera.is_some();
        let camera = match camera {
            Some(camera) => camera,
            None => {
                // The fixed rig aims at the MD20 header box, never the selected
                // geosets' live bounds. All values here are current-target literals.
                let bounds = benilla_formats::parse_m2_bounds(bytes).map_err(|e| e.to_string())?;
                let center =
                    (Vec3::from_array(bounds.bbox_min) + Vec3::from_array(bounds.bbox_max)) * 0.5;
                benilla_formats::M2PortraitCamera {
                    position: [200.0 / 36.0, 0.0, 87.0 / 36.0],
                    target: center.to_array(),
                    fov: 0.5,
                    near_clip: 1.0 / 36.0,
                    far_clip: 5000.0,
                    roll: 0.0,
                }
            }
        };
        Ok(Self { camera, authored })
    }

    pub fn root_scale(&self, display_aspect: f32) -> f32 {
        if self.authored {
            1.0
        } else {
            // Native 1407af074..1407af090; authored camera branch keeps 1.
            ((25.0 / 9.0) / (display_aspect * display_aspect + 1.0)).sqrt()
        }
    }

    pub fn pose(&self, aspect: f32) -> (Transform, Projection) {
        let camera = self.camera;
        let eye = benilla_assets::coords::wow_to_bevy(camera.position);
        let target = benilla_assets::coords::wow_to_bevy(camera.target);
        let direction = (target - eye).normalize_or_zero();
        let up = Quat::from_axis_angle(direction, camera.roll) * Vec3::Y;
        (
            Transform::from_translation(eye).looking_at(target, up),
            Projection::custom(PaneProjection {
                fov: camera.fov,
                near: camera.near_clip,
                far: camera.far_clip,
                aspect,
            }),
        )
    }
}

/// Native 16-byte custom projection. The pane's logical aspect survives both
/// per-axis target caps and Bevy's target-size update pass.
#[derive(Clone, Debug)]
struct PaneProjection {
    fov: f32,
    near: f32,
    far: f32,
    aspect: f32,
}

impl PaneProjection {
    fn fovy(&self) -> f32 {
        self.fov / (self.aspect * self.aspect + 1.0).sqrt()
    }
}

impl CameraProjection for PaneProjection {
    fn get_clip_from_view(&self) -> Mat4 {
        Mat4::perspective_infinite_reverse_rh(self.fovy(), self.aspect, self.near)
    }

    fn get_clip_from_view_for_sub(&self, _sub_view: &SubCameraView) -> Mat4 {
        self.get_clip_from_view()
    }

    fn update(&mut self, _width: f32, _height: f32) {}

    fn far(&self) -> f32 {
        self.far
    }

    fn get_frustum_corners(&self, z_near: f32, z_far: f32) -> [Vec3A; 8] {
        let tangent = (self.fovy() * 0.5).tan();
        let near_y = z_near.abs() * tangent;
        let far_y = z_far.abs() * tangent;
        let near_x = near_y * self.aspect;
        let far_x = far_y * self.aspect;
        [
            Vec3A::new(near_x, -near_y, z_near),
            Vec3A::new(near_x, near_y, z_near),
            Vec3A::new(-near_x, near_y, z_near),
            Vec3A::new(-near_x, -near_y, z_near),
            Vec3A::new(far_x, -far_y, z_far),
            Vec3A::new(far_x, far_y, z_far),
            Vec3A::new(-far_x, far_y, z_far),
            Vec3A::new(-far_x, -far_y, z_far),
        ]
    }
}
