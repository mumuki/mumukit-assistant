class Mumukit::Assistant::Rule::SubmissionFailed < Mumukit::Assistant::Rule::Base
  def matches?(submission)
    submission.status.failed?
  end
end