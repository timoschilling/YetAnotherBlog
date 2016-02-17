class ApplicationConcept < Cell::Concept
  def call(state = :show, *args, &block)
    res = nil

    ms = Benchmark.ms do
      res = super
    end

    puts "#{self.class}##{state} %0.3fms" % ms

    res
  end
end
