class ImmutableStruct
  VERSION = '1.0.1'
  
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
          struct_initialize(*members.map { |m| attrs.first[m.to_sym] })
        else
          struct_initialize(*attrs)
        end
      end
      
      def to_h
        members.inject({}) do |h, m|
          h[m.to_sym] = self[m]
          h
        end
      end
    end
  end
end