require "AssessmentBase.rb"

module LabZero
  include AssessmentBase

  def assessmentInitialize(course)
    super("lab0",course)
    @problems = []
  end

end
