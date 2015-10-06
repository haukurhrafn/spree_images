module Spree
  module Admin
    class SiteImagesController < ResourceController

      def index
        @images = Spree::Image.all
        respond_with(@images)
      end

      def edit
        @image = Spree::Image.find(params[:id])
        respond_with(@image)
      end

      def new
        @image = Spree::Image.new
        respond_with(@image)
      end

      def create
        authorize! :create, Spree::Image
        @image = Spree::Image.new
        @image.attachment = params["image"]["attachment"]
        if @image.save
          # respond_with(admin_image_path(@image), status: 201, default_template: :edit)
          # redirect_to admin_image_path(@image), status: 201, default_template: :edit
          redirect_to edit_admin_image_path(@image)
        else
          return render @image
        end
      end

      def update
        @image = Spree::Image.find(params["id"])
        @image.attachment = params["image"]["attachment"]
        if @image.save
          redirect_to admin_image_path(@image), status: 201, default_template: :edit
        else
          return render @image
        end
      end

      def destroy
        @image = Spree::Image.find(params["id"])
        @image.destroy
        redirect_to admin_images_path
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
