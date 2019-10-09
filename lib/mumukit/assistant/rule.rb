module Mumukit::Assistant::Rule
  def self.parse(hash)
    message = Mumukit::Assistant::Message.parse hash[:then]
    w = hash[:when]
    if w.is_a? Hash
      parse_complex_when w.first, message
    else
      parse_simple_when w, message
    end
  end

  def self.parse_simple_when(w, message)
    case w.to_sym
      when :content_empty                    then Mumukit::Assistant::Rule::ContentEmpty.new(message)
      when :submission_errored               then Mumukit::Assistant::Rule::SubmissionErrored.new(message)
      when :submission_failed                then Mumukit::Assistant::Rule::SubmissionFailed.new(message)
      when :submission_passed_with_warnings  then Mumukit::Assistant::Rule::SubmissionPassedWithWarnings.new(message)
      else raise "Unsupported rule #{w}"
    end
  end

  def self.parse_complex_when(w, message)
    condition, value = *w
    case condition.to_sym
      when :error_contains                 then Mumukit::Assistant::Rule::ErrorContains.new(message, value)
      when :these_tests_failed             then Mumukit::Assistant::Rule::TheseTestsFailed.new(message, value)
      when :only_these_tests_failed        then Mumukit::Assistant::Rule::OnlyTheseTestsFailed.new(message, value)
      when :these_expectations_failed      then Mumukit::Assistant::Rule::TheseExpectationsFailed.new(message, value)
      when :only_these_expectations_failed then Mumukit::Assistant::Rule::OnlyTheseExpectationsFailed.new(message, value)
      else raise "Unsupported rule #{condition}"
    end
  end
end

require_relative 'rule/base.rb'
require_relative 'rule/content_empty.rb'
require_relative 'rule/submission_failed.rb'
require_relative 'rule/these_tests_failed.rb'
require_relative 'rule/only_these_tests_failed.rb'
require_relative 'rule/submission_passed_with_warnings.rb'
require_relative 'rule/these_expectations_failed.rb'
require_relative 'rule/only_these_expectations_failed.rb'
require_relative 'rule/submission_errored.rb'
require_relative 'rule/error_contains.rb'
