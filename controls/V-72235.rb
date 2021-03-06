# encoding: utf-8
#
=begin
-----------------
Benchmark: Red Hat Enterprise Linux 7 Security Technical Implementation Guide
Status: Accepted

This Security Technical Implementation Guide is published as a tool to improve
the security of Department of Defense (DoD) information systems. The
requirements are derived from the National Institute of Standards and
Technology (NIST) 800-53 and related documents. Comments or proposed revisions
to this document should be sent via email to the following address:
disa.stig_spt@mail.mil.

Release Date: 2017-03-08
Version: 1
Publisher: DISA
Source: STIG.DOD.MIL
uri: http://iase.disa.mil
-----------------
=end

control "V-72235" do
  title "All networked systems must use SSH for confidentiality and integrity of
transmitted and received information as well as information during preparation for
transmission."
  desc  "
    Without protection of the transmitted information, confidentiality and integrity
may be compromised because unprotected communications can be intercepted and either
read or altered.

    This requirement applies to both internal and external networks and all types of
information system components from which information can be transmitted (e.g.,
servers, mobile devices, notebook computers, printers, copiers, scanners, and
facsimile machines). Communication paths outside the physical protection of a
controlled boundary are exposed to the possibility of interception and modification.

    Protecting the confidentiality and integrity of organizational information can
be accomplished by physical means (e.g., employing physical distribution systems) or
by logical means (e.g., employing cryptographic techniques). If physical means of
protection are employed, then logical means (cryptography) do not have to be
employed, and vice versa.

    Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000423-GPOS-00188,
SRG-OS-000423-GPOS-00189, SRG-OS-000423-GPOS-0019.
  "
  impact 0.5
  tag "severity": "medium"
  tag "gtitle": "SRG-OS-000423-GPOS-00187"
  tag "gid": "V-72235"
  tag "rid": "SV-86859r2_rule"
  tag "stig_id": "RHEL-07-040310"
  tag "cci": "CCI-002418"
  tag "nist": ["SC-8", "Rev_4"]
  tag "cci": "CCI-002420"
  tag "nist": ["SC-8 (2)", "Rev_4"]
  tag "cci": "CCI-002421"
  tag "nist": ["SC-8 (1)", "Rev_4"]
  tag "cci": "CCI-002422"
  tag "nist": ["SC-8 (2)", "Rev_4"]
  tag "check": "Verify SSH is loaded and active with the following command:

# systemctl status sshd
 sshd.service - OpenSSH server daemon
   Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled)
   Active: active (running) since Tue 2015-11-17 15:17:22 EST; 4 weeks 0 days ago
 Main PID: 1348 (sshd)
   CGroup: /system.slice/sshd.service
           ??1348 /usr/sbin/sshd -D

If \"sshd\" does not show a status of \"active\" and \"running\", this is a finding."
  tag "fix": "Configure the SSH service to automatically start after reboot with the
following command:

# systemctl enable sshd ln -s '/usr/lib/systemd/system/sshd.service'
'/etc/systemd/system/multi-user.target.wants/sshd.service'"

  describe systemd_service('sshd.service') do
    it { should be_running }
  end
end
