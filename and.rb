module And
  class Double
    attr_accessor :input_a, :input_b

    def output
      if input_a == 1
        if input_b == 1
          1
        else
          0
        end
      else
        0
      end
    end

  end

  class Triple
    attr_accessor :input_a, :input_b, :input_c

    def output
      left = Double.new
      left.input_a = input_a
      left.input_b = input_b

      right = Double.new
      right.input_a = left.output
      right.input_b = input_c

      right.output

      #  input_a && input_b && input_c
      # true && true && true
      #  <double>----
      # (true && true) && true
      #   ----------<double >
       # only using double gates
    end

  end

  class Multi
    inputs = ("a".."z").map {|c| ("input_" + c).to_sym }
    attr_accessor *inputs
    attr_reader :inputs, :count

    def initialize(count)
      @count = count
      @inputs = {}
      # input_a .. (count)
    end

    def set_input(input, value)
      # {:a => 1}
      inputs[input] = value
    end

    def get_input(input)
      inputs[input]
    end

    def output
      # dependingh on count
      # split up inputs -- combine first 2
      # with a double gate
      # then use result of that into a
      # double gate for the third
      # then the result of that into a double for the fourth...
      gate = Double.new
      gate.input_a = inputs[:a]
      gate.input_b = inputs[:b]
      gate.output


      keys = ("a".."z").map(&:to_sym).take(count)
      sources = keys.map do |k|
        inputs[k]
      end

      sources.reduce(nil) do |last, current|
        if last.nil?
          current
        else
          g = Double.new
          g.input_a = last
          g.input_b = current
          g.output
        end
      end
    end
  end
end
