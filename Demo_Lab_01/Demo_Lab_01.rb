require "AssessmentBase.rb"

module Hello
  include AssessmentBase

  def assessmentInitialize(course)
    super("Merge Strings", course)
    @problems = []
  end

end
