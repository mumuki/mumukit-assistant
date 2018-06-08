require 'mumukit/core'
require 'i18n'

I18n.load_translations_path File.join(__dir__, '..', 'locales', '*.yml')

module Mumukit
  # An assistant is used to generate dynamic feedback
  # over a student's submission, based on rules.
  #
  # This feedback is composed of a list of markdown messages called _tips_,
  # and the whole processes of creating this feedback is called _assistance_.
  class Assistant
    attr_accessor :rules

    def initialize(rules)
      @rules = rules
    end

    # Provides tips for the student for the given submission,
    # based on the `rules`.
    def assist_with(submission)
      @rules
        .select { |it| it.matches?(submission) }
        .map { |it| it.message_for(submission.attemps_count) }
    end

    def self.parse(rules)
      new rules.map { |it| Mumukit::Assistant::Rule.parse it }
    end
  end
end

require_relative './assistant/rule'
require_relative './assistant/message'
require_relative './assistant/narrator'
require_relative './assistant/version'
