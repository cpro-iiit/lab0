require "AssessmentBase.rb"

module Test_san_fun
  include AssessmentBase

  def assessmentInitialize(course)
    super("Merge Strings", course)
    @problems = []
  end

end
