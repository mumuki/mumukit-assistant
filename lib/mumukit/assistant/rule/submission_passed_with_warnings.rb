class Mumukit::Assistant::Rule::SubmissionPassedWithWarnings < Mumukit::Assistant::Rule::Base
  def matches?(submission)
    submission.status.passed_with_warnings?
  end
end