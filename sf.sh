# HWUI properties
resetprop -n debug.hwui.renderer vulkan
resetprop -n debug.hwui.use_hint_manager false

# RenderEngine backend
resetprop -n debug.renderengine.backend threaded

# ANGLE backend
resetprop -n debug.angle.backend vulkan

# Debugging SurfaceFlinger
resetprop -n debug.sf.hw 1
resetprop -n debug.sf.early.app.duration 1000000
resetprop -n debug.sf.late.app.duration 1000000
resetprop -n debug.sf.early.sf.duration 1000000
resetprop -n debug.sf.late.sf.duration 1000000
resetprop -n debug.sf.enable_hwc_vds 0
resetprop -n debug.sf.set_idle_timer_ms 1000
resetprop -n debug.sf.latch_unsignaled 1
resetprop -n debug.sf.high_fps_early_app_phase_offset_ns -4000000
resetprop -n debug.sf.high_fps_late_app_phase_offset_ns 1000000
resetprop -n debug.sf.high_fps_early_sf_phase_offset_ns -4000000
resetprop -n debug.sf.high_fps_late_sf_phase_offset_ns 1000000
resetprop -n debug.sf.enable_advanced_sf_phase_offset 1
resetprop -n debug.sf.disable_client_composition_cache 0
resetprop -n debug.sf.enable_gl_backpressure 0
resetprop -n debug.sf.disable_backpressure 1
resetprop -n debug.sf.frame_rate_multiple_threshold 120
resetprop -n debug.sf.layer_caching_active_layer_timeout_ms 1000
resetprop -n debug.sf.enable_adpf_cpu_hint true

# OpenGL Hardware Acceleration
resetprop -n debug.egl.hw 0

# Konfigurasi ini menggunakan Vulkan sebagai rendering backend, dimana dapat menyebabkan masalah pada perangkat yang tidak dioptimalkan untuk Vulkan dan beberapa Aplikasi.
# Konfigurasi ini juga difokuskan untuk performa, dimana tidak efisien untuk penggunaan daily.
