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
      includes_failing_expectation? it, submission.expectation_results
    end
  end

  def includes_failing_expectation?(humanized_expectation, expectation_results)
    binding, inspection = humanized_expectation.split(' ')
    expectation_results.include? binding: binding, inspection: inspection, result: :failed
  end
end