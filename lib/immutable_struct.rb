class ImmutableStruct
  def self.new(*attrs)
    struct = Struct.new(*attrs)
    make_immutable!(struct)
    optionalize_constructor!(struct)
    struct
  end
  
private

  def self.make_immutable!(struct)
    struct.send(:undef_method, "[]=".to_sym)
    struct.members.each do |member|
      struct.send(:undef_method, "#{member}=".to_sym)
    end
  end
  
  def self.optionalize_constructor!(struct)
    struct.class_eval do
      alias_method :struct_initialize, :initialize

      def initialize(*attrs)
        if attrs && attrs.size == 1 && attrs.first.is_a?(Hash)
          super(*members.map { |m| attrs.first[m.to_sym] })
        else
          super
        end
      end
    end
  end
end