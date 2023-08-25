class SchedulesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = 'スケジュールを登録しました。'
      redirect_to root_url
    else
      @pagy, @schedules = pagy(current_user.schedules.order(start_datetime: :asc))
      flash.now[:danger] = 'スケジュールの登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    
    @schedule.destroy
    flash[:success] = 'スケジュールを削除しました。'
    redirect_to root_url
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update(schedule_params)
      flash[:success] = 'スケジュールは正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'スケジュールは更新されませんでした'
      render :edit
    end
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:content, :start_datetime, :finish_datetime)
  end
end
