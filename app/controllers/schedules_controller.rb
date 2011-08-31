class SchedulesController < ApplicationController
  before_filter :load_schedule

  def index
    @entries = @schedule.entries(:since => 1.days.ago, :until => 30.days.from_now)
  end
  
  def show
    user = User.find_by_first_name(params[:user])
    respond_to do |format|
      format.html do
        @entries = @schedule.entries(:since => Time.now, :until => 'Midnight', :user_id => user.id, :overflow => true)
      end
      format.ics do
        @entries = @schedule.entries(:since => 1.days.ago, :until => 30.days.from_now, :user_id => user.id, :overflow => true)
      end
    end
  end

  private

  def load_schedule
    @schedule = Schedule.find_by_name_or_id(params[:id])
  end
end
