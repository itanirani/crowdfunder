class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :choose_reward]

  # GET /projects
  # GET /projects.json
  def choose_reward
    @reward = Reward.find(params[:reward])
    current_user.donations << Donation.create(amount: @reward.amount, project_id: @project.id)
    current_user.rewards << @reward


    redirect_to :root, notice: "You have chosen project and reward"
    
    
  end

  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    total = 0
    @project.donations.to_a.each {|d| total+= d.amount}
    @need_money = @project.goal - total
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.rewards.build
  end

  # GET /projects/1/edit
  def edit
    @project.rewards.build
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :goal, :start_date, :finish_date, :reward, rewards_attributes: [:id, :description, :amount, :_destroy])
    end
end
