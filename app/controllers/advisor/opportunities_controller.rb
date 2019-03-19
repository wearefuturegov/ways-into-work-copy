class Advisor::OpportunitiesController < Advisor::BaseController
  def index
    @opportunities = Opportunity.all_active
  end

  def new
    @opportunity_types = Opportunity.types
  end

  def create
    case params[:opportunity_type]
    when "Job"
      redirect_to new_advisor_job_path
    end
  end

end