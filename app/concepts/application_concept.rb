class ApplicationConcept < Cell::Concept
  def call(state = :show, *args, &block)
    res = nil

    ms = Benchmark.ms do
      res = super
    end

    $cells_time += ms if self.is_a? Post::Cell::Index

    puts "#{self.class}##{state} %0.3fms" % ms

    res
  end
end
