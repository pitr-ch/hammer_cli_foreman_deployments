module HammerCLIForemanDeployments

  class Deployment < HammerCLIForeman::Command

    resource :deployments

    class ListCommand < HammerCLIForeman::ListCommand

      output do
        field :id, _("Id")
        field :name, _("Name")
        HammerCLIForeman::References.taxonomies(self)
        HammerCLIForeman::References.timestamps(self)
        field :stack, _("Stack"), Fields::Reference
      end

      def execute
        super
      end

      build_options
    end


    class InfoCommand < HammerCLIForeman::InfoCommand

      output ListCommand.output_definition do
        field :description, _("Description")
      end

      build_options
    end


    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _("Deployment created")
      failure_message _("Could not create the deployment")

      build_options
    end


    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("Deployment deleted")
      failure_message _("Could not delete the deployment")

      build_options
    end


    class UpdateCommand < HammerCLIForeman::UpdateCommand
      success_message _("Deployment updated")
      failure_message _("Could not update the deployment")

      build_options
    end

    autoload_subcommands
  end

end
