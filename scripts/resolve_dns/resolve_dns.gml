/// @function resolve_dns_raw(domain)
function resolve_dns_raw(_domain) {
    var _socket = network_create_socket(network_socket_udp);
    var _buffer = buffer_create(512, buffer_fixed, 1);
    
    buffer_seek(_buffer, buffer_seek_start, 0);
    
    // 1. DNS HEADER (12 bytes)
    buffer_write(_buffer, buffer_u16, 0x1234); // Transaction ID
    buffer_write(_buffer, buffer_u16, 0x0001); // Flags: Standard Query (Big Endian 0x0100)
    buffer_write(_buffer, buffer_u16, 0x0001); // Questions: 1
    buffer_write(_buffer, buffer_u16, 0x0000); // Answer RRs: 0
    buffer_write(_buffer, buffer_u16, 0x0000); // Authority RRs: 0
    buffer_write(_buffer, buffer_u16, 0x0000); // Additional RRs: 0

    // 2. QUESTION SECTION
    // Split "google.com" into parts and write as [length][string]
    var _parts = string_split(_domain, ".");
    for (var i = 0; i < array_length(_parts); i++) {
        var _p = _parts[i];
        buffer_write(_buffer, buffer_u8, string_length(_p));
        for (var j = 1; j <= string_length(_p); j++) {
            buffer_write(_buffer, buffer_u8, string_ord_at(_p, j));
        }
    }
    buffer_write(_buffer, buffer_u8, 0); // End of domain name
    
    // QType (A record = 1) and QClass (IN = 1)
    buffer_write(_buffer, buffer_u16, 0x0100); // Type A (Big Endian)
    buffer_write(_buffer, buffer_u16, 0x0100); // Class IN (Big Endian)

    // 3. SEND
    network_send_udp_raw(_socket, "1.1.1.1", 53, _buffer, buffer_tell(_buffer));
    
    // Clean up local buffer, but keep socket open for the response!
    buffer_delete(_buffer);
    return _socket; 
}
