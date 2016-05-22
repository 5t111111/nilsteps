module Nilsteps
  module Keyword
    def step_number(name)
      return nil unless name =~ /\Abar(\d+)_(\d+)\z/
      @step_number_memo ||= {}
      if value = @step_number_memo.fetch(name, nil)
        value
      else
        @step_number_memo[name] = 16 * ($1.to_i - 1) + $2.to_i
      end
    end

    def method_missing(name, *args)
      return super unless result = step_number(name)
      result
    end
  end
end
