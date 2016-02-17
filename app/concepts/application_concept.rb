class ApplicationConcept < Cell::Concept
  def call(state = :show, *args, &block)
    res = nil

    ms = Benchmark.ms do
      res = super
    end

    puts "#{self.class}##{state} %0.3fms" % ms

    res
  end

  def self.register(view)
    class_name = name.split("::")[0].parameterize("_")

    file = "app/concepts/#{class_name}/views/#{view}.haml"

    puts "Compile: #{file}"
    template = File.read(file)
    source = ::Hamlit::Engine.new(escape_html: false, escape_attrs: false).call(template)
    class_eval %Q{
      def #{view}
        res = begin
          #{source}
        end
        res
      end
    }
  end
end
