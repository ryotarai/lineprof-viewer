class ProfiledFilesController < ApplicationController
  before_action :set_profiled_file, only: [:show]

  def show
  end

  private
    def set_profiled_file
      @profiled_file = ProfiledFile.find(params[:id])
    end
end

