module Spree
  module Admin
    class SiteImagesController < ResourceController

      def index
        @images = Spree::Image.all
        respond_with(@images)
      end

      def edit
        binding.pry
        @image = Spree::Image.find(params[:id])
        respond_with(@image)
      end

      protected


      def new_object_url(options = {})
        new_admin_image_url(options)
      end

      def edit_object_url(object, options = {})
        edit_admin_image_url(object, options)
      end

      def object_url(object = nil, options = {})
        admin_images_url(object, options)
      end

      def collection_url(options = {})
         admin_images_url(options)
      end




      def load_resource
      #   binding.pry
      #   # if member_action?
      #   #   @object ||= load_resource_instance

      #   #   # call authorize! a third time (called twice already in Admin::BaseController)
      #   #   # this time we pass the actual instance so fine-grained abilities can control
      #   #   # access to individual records, not just entire models.
      #   #   authorize! action, @object

      #   #   instance_variable_set("@site_image", @object)
      #   # else
      #   #   @collection ||= collection

      #   #   # note: we don't call authorize here as the collection method should use
      #   #   # CanCan's accessible_by method to restrict the actual records returned

      #   #   instance_variable_set("@site_images", @collection)
      #   # end
      end

      private

      def location_after_save
        url_for([:edit, :admin, @image])
      end

    end
  end
end
