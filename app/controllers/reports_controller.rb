# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]

  def index
    @reports = Report.includes(:user).order(id: :desc).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = current_user.reports.new
  end

  def edit; end

  def create
    @report = current_user.reports.new(report_params)
    success = false
    ActiveRecord::Base.transaction do
      @report.save!
      create_mentions
      success = true
    end

    if success
      redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    success = false
    ActiveRecord::Base.transaction do
      @report.update!(report_params)
      create_mentions
      success = true
    end

    if success
      redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy

    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end

  def create_mentions
    mentioned_report_ids = @report.content.scan(%r{http://localhost:3000/reports/(\d+)}).flatten.uniq
    mentioned_report_ids.map(&:to_i).each do |id|
      Mention.create!(mentioned_report_id: id, mentioning_report_id: @report.id)
    end
  end
end
