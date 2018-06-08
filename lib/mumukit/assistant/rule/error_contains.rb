class Mumukit::Assistant::Rule::ErrorContains < Mumukit::Assistant::Rule::SubmissionErrored
  def initialize(message, text)
    super(message)
    @text = text
  end

  def matches?(submission)
    super && submission.result.include?(@text)
  end
end