class Mumukit::Assistant::Rule::TheseExpectationsFailed < Mumukit::Assistant::Rule::SubmissionPassedWithWarnings
  def initialize(message, expectations)
    raise 'missing expectations' if expectations.blank?
    super(message)
    @expectations = expectations
  end

  def matches?(submission)
    super && matches_failing_expectations?(submission)
  end

  def matches_failing_expectations?(submission)
    @expectations.all? do |it|
      includes_failing_expectation? it, submission
    end
  end

  def failed_expectations(submission)
    @failed_expectations ||= submission.expectation_results.select { |it| it[:result].failed? }
  end

  def includes_failing_expectation?(humanized_expectation, submission)
    binding, inspection = humanized_expectation.split(' ')
    failed_expectations(submission).any? { |it| it[:binding] == binding && it[:inspection] == inspection }
  end
end