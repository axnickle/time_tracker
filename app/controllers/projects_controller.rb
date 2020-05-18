class ProjectsController < ApplicationController
  def index
    @projects = Project.all #pulling projects out of Project model
  end
end
