/*
 * dcache.groovy
 */
def protocolVersion = 1
def hostname = localhost
def port = 4557

s = new Socket(hostname, port)
s.withStreams { input, output ->
  def dos = new DataOutputStream(output)
  def dis = new DataInputStream(input)
  // Negotiate handshake/version
  dos.write('NiFi'.bytes)
  dos.writeInt(protocolVersion)
  dos.flush()
  status = dis.read()
  while(status == 21) {
     protocolVersion = dis.readInt()
     dos.writeInt(protocolVersion)
     dos.flush()
     status = dis.read()
  }

  dos.writeUTF('keySet')
  dos.flush()
  int numKeys = dis.readInt()
  (0..numKeys-1).each {
    def length = dis.readInt()
    def bytes = new byte[length]
    dis.readFully(bytes)
    println new String(bytes)
    def key = new String(bytes)
    dos.writeUTF('remove')
    def baos = new ByteArrayOutputStream()
    baos.write(key)
    dos.writeInt(baos.size())
    baos.writeTo(dos)
    dos.flush()
    def success = dis.readBoolean()
    println success ? "Removed $it" : "Could not remove $it"
  }

  // Close
  dos.writeUTF("close");
  dos.flush();
}
