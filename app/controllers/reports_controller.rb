class ReportsController < ApplicationController
  def index
    @reports = Report.order(id: :desc)
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id 
    @report.save
    redirect_to reports_path(@user)
  end

  def edit
    @report = Report.find(params[:id])
  end
  
  def update
    @report = Report.find(params[:id])
    @report.user_id = current_user.id
    if @report.update(report_params)
     redirect_to report_path(@report), notice: '更新しました。'
    end
  end
  
  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path, notice: '削除しました。'
  end
  
  private
  
  def report_params
    params.require(:report).permit(:title, :body, :image)
  end
end
