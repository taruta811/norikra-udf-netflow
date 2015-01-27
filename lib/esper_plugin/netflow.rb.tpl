require 'java'
java_package 'io.github.yokamaru.norikra.udf'

class NetFlow

  @@my_ases = <%= my_ases %>

  @@router_mapping = <%= router_mapping %>

  @@ipaddr_asn_mapping = <%= ipaddr_asn_mapping %>

  java_signature 'String direction(long src_as, long dst_as)'
  def self.direction(src_as, dst_as)
    if @@my_ases.include?(src_as) then
      return "out"
    elsif @@my_ases.include?(dst_as) then
      return "in"
    end

    return nil
  end

  java_signature 'String router(String host_ipaddr)'
  def self.router(host_ipaddr)
    if @@router_mapping.has_key?(host_ipaddr) then
      return @@router_mapping[host_ipaddr]["name"]
    end

    return nil
  end

  java_signature 'String career(String host_ipaddr, long ifindex_in, long ifindex_out, String flow_direction)'
  def self.career(host_ipaddr, ifindex_in, ifindex_out, flow_direction)
    ifindex = nil
    if flow_direction == "in" then
      ifindex = ifindex_in
    elsif flow_direction == "out" then
      ifindex = ifindex_out
    end

    if @@router_mapping.has_key?(host_ipaddr) then
      return @@router_mapping[host_ipaddr]["interfaces"][ifindex]
    end

    return nil
  end

  java_signature 'long opposite_asn(long src_as, long dst_as, String ipv4_src_addr, String ipv4_dst_addr)'
  def self.opposite_asn(src_as, dst_as, ipv4_src_addr, ipv4_dst_addr)
    opposite_as_number = nil
    opposite_ipaddr = nil
    if @@my_ases.include?(src_as) then
      opposite_as_number = dst_as
      opposite_ipaddr = ipv4_dst_addr
    elsif @@my_ases.include?(dst_as) then
      opposite_as_number = src_as
      opposite_ipaddr = ipv4_src_addr
    end

    if opposite_as_number.nil? then
      return nil
    end

    if opposite_as_number != 23456 then
      return opposite_as_number
    end

    @@ipaddr_asn_mapping.each do |subnet, asn|
      subnet = org.apache.commons.net.util.SubnetUtils.new(subnet)
      if subnet.getInfo().isInRange(opposite_ipaddr) then
        return asn
      end
    end

    return opposite_as_number
  end
end
