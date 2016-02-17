class ApplicationConcept < Cell::Concept
  def call(state = :show, *args, &block)
    res = nil

    ms = Benchmark.ms do
      res = super
    end

    $cells_time += ms if self.class == Post

    puts "#{self.class}##{state} %0.3fms" % ms

    res
  end
end
