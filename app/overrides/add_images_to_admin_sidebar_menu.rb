Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'images_admin_sidebar_menu',
  insert_bottom: '#main-sidebar',
  partial: 'spree/admin/shared/images_sidebar_menu'
)
