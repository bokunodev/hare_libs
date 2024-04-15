export @symbol("SDLNET_Init") Init() int;
export @symbol("SDLNET_Quit") Quit() void;

export type IPaddress = struct {
	host: u32,
	port: u16,
};

export def INADDR_ANY       = 0x00000000;
export def INADDR_NONE      = 0xFFFFFFFF;
export def INADDR_LOOPBACK  = 0x7f000001;
export def INADDR_BROADCAST = 0xFFFFFFFF;

export @symbol("SDLNET_ResolveHost")       ResolveHost(address: *IPaddress, host: *c::char, port: u16) int;
export @symbol("SDLNET_ResolveIP")         ResolveIP(ip: *IPaddress) *c::char;
export @symbol("SDLNET_GetLocalAddresses") GetLocalAddresses(addresses: *IPaddress, maxcount: int) int;

export type TCPsocket = *opaque;

export @symbol("SDLNET_TCP_Open")           TCP_Open(ip: *IPaddress) TCPsocket;
export @symbol("SDLNET_TCP_Accept")         TCP_Accept(server: TCPsocket) TCPsocket;
export @symbol("SDLNET_TCP_GetPeerAddress") TCP_GetPeerAddress(sock: TCPsocket) *IPaddress;
export @symbol("SDLNET_TCP_Send")           TCP_Send(sock: TCPsocket, data: *opaque, _len: int) int;
export @symbol("SDLNET_TCP_Recv")           TCP_Recv(sock: TCPsocket, data: *opaque, maxlen: int) int;
export @symbol("SDLNET_TCP_Close")          TCP_Close(sock: TCPsocket) void;

export def MAX_UDPCHANNELS  = 32;
export def MAX_UDPADDRESSES = 4;

export type UDPsocket = *opaque;

export type UDPpacket = struct {
	channel: int, 
	data:    *u8, 
	_len:    int, 
	maxlen:  int, 
	status:  int, 
	address: IPaddress, 
};

export @symbol("SDLNET_AllocPacket")        AllocPacket(size: int) *UDPpacket;
export @symbol("SDLNET_ResizePacket")       ResizePacket(packet: *UDPpacket, newsize: int) int;
export @symbol("SDLNET_FreePacket")         FreePacket(packet: *UDPpacket) void;
export @symbol("SDLNET_AllocPacketV")       AllocPacketV(howmany: int, size: int) *[*]UDPpacket;
export @symbol("SDLNET_FreePacketV")        FreePacketV(packetV: *[*]UDPpacket) void;
export @symbol("SDLNET_UDP_Open")           UDP_Open(port: u16) UDPsocket;
export @symbol("SDLNET_UDP_SetPacketLoss")  UDP_SetPacketLoss(sock: UDPsocket, percent: int) void;
export @symbol("SDLNET_UDP_Bind")           UDP_Bind(sock: UDPsocket, channel: int, address: *IPaddress) int;
export @symbol("SDLNET_UDP_Unbind")         UDP_Unbind(sock: UDPsocket, channel: int) void;
export @symbol("SDLNET_UDP_GetPeerAddress") UDP_GetPeerAddress(sock: UDPsocket, channel: int) *IPaddress;
export @symbol("SDLNET_UDP_SendV")          UDP_SendV(sock: UDPsocket, packets: *[*]UDPpacket, npackets: int) int;
export @symbol("SDLNET_UDP_Send")           UDP_Send(sock: UDPsocket, channel: int, packet: *UDPpacket) int;
export @symbol("SDLNET_UDP_RecvV")          UDP_RecvV(sock: UDPsocket, packets: *[*]UDPpacket) int;
export @symbol("SDLNET_UDP_Recv")           UDP_Recv(sock: UDPsocket, packet: *UDPpacket) int;
export @symbol("SDLNET_UDP_Close")          UDP_Close(sock: UDPsocket) void;

export type SocketSet = *opaque;
export type GenericSocket = *struct{int ready};

export @symbol("SDLNET_AllocSocketSet") AllocSocketSet(maxsockets: int) SocketSet;
export @symbol("SDLNET_AddSocket")      AddSocket(set: SocketSet, sock: GenericSocket) int;

export fn TCP_AddSocket(set: SocketSet, sock: TCPsocket) int = AddSocket(set, sock:GenericSocket);
export fn UDP_AddSocket(set: SocketSet, sock: UDPsocket) int = AddSocket(set, sock:GenericSocket);

export @symbol("SDLNET_DelSocket") DelSocket(set: SocketSet, sock: GenericSocket) int;

export fn TCP_DelSocket(set: SocketSet, sock: TCPsocket) int = DelSocket(set, sock:GenericSocket);
export fn UDP_DelSocket(set: SocketSet, sock: UDPsocket) int = DelSocket(set, sock:GenericSocket);

export @symbol("SDLNET_CheckSockets")  CheckSockets(set: SocketSet, timeout: u32) int;
export @symbol("SDLNET_FreeSocketSet") FreeSocketSet(set: SocketSet) void;
export @symbol("SDLNET_SetError")      SetError(fmt: *c::char...) void;
export @symbol("SDLNET_GetError")      GetError() *c::char;
