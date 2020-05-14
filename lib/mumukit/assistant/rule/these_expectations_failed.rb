class Mumukit::Assistant::Rule::TheseExpectationsFailed < Mumukit::Assistant::Rule::SubmissionPassedWithWarnings
  def initialize(message, expectations, strict: false)
    raise 'missing expectations' if expectations.blank?
    super(message)
    @expectations = expectations
    @strict = strict
  end

  def matches?(submission)
    (!@strict || super) && matches_failing_expectations?(submission)
  end

  def matches_failing_expectations?(submission)
    @expectations.all? do |it|
      includes_failing_expectation? it, submission
    end
  end

  def failed_expectations(submission)
    @failed_expectations ||= submission.expectation_results.select { |it| it.indifferent_get(:result).failed? }
  end

  def includes_failing_expectation?(humanized_expectation, submission)
    binding, inspection = humanized_expectation.split(' ')
    failed_expectations(submission).any? { |it| it.indifferent_get(:binding) == binding && it.indifferent_get(:inspection) == inspection }
  end
end
