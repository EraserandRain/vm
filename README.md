## Vagrantfile 配置
Vagrantfile 配置，详见 [Vagrant 配置操作](https://www.notion.so/63706f924ceb46768c2170a3a73e382e?v=2094293253fb418baf7213f4cce3f337)。

示例：
```yaml

host_list = [
  {
    :name => "generic/centos7",
    :box => "generic_centos7",
    :hostname => "centos-vm",
    :ipaddr => "192.168.2.82",
    :bridge => "enp8s0"
  },
]
Vagrant.configure("2") do |config|
  host_list.each do |item|
    config.vm.define item[:name]  do |host|
      host.vm.box=item[:box]
      host.vm.hostname=item[:hostname]
      host.vm.provision "shell", path: "reset/start.sh"
      host.vm.network "public_network",ip: item[:ipaddr],bridge: item[:bridge]
    end
  end
end

```
