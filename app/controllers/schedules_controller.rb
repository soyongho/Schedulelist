class SchedulesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = 'スケジュールを登録しました。'
      redirect_to root_url
    else
      @pagy, @schedules = pagy(current_user.schedules.order(id: :desc))
      flash.now[:danger] = 'スケジュールの登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @schedule.destroy
    flash[:success] = 'スケジュールを削除しました。'
    redirect_to root_url
  end

  def edit
  end

  def update
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:content)
  end
  
  def correct_user
    @schedule = current_user.schedules.find_by(id: params[:id])
    unless @schedule
      redirect_to root_url
    end
  end
end
