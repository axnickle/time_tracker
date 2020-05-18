class TimeEntryController < ApplicationController

  def index
    @time_entry = TimeEntry.all
  end

  
