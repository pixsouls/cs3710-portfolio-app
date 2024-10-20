class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    # If it is not blank, then there is a major selected. Potential security flaw found though? :o
    if params[:major].present?
      @students = Student.where(major: params[:major])
    end
    if params[:graduation_date].present?
      selected_date = Date.parse(params[:graduation_date])
      if params[:time].present?
        if params[:time] == 'before'
          @students = Student.where('graduation_date < ?', selected_date.end_of_day)
        else params[:time] == 'after'
          @students = Student.where('graduation_date > ?', selected_date.beginning_of_day)
        end
      end
    else
      @students = Student.where(major: params[:major])
    end
  end


  # GET /students/1 or /students/1.json
  def show
    @student = Student.find(params[:id])  # Fetch a single student by ID
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        puts @student.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

    
  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to students_path, status: :see_other, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :school_email, :major, :minor, :graduation_date, :profile_picture, :time, :graduation_date)
    end
end
