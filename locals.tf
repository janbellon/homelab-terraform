
locals {
    vm_defaults = {
        image ="ubuntu-24.04"
        node  = "pve-r821"
        netbox_cluster = 1
        cores = 2
        memory = 2048
        disk_size = 16
        ip = "dhcp"
        gateway = "10.2.50.1"
        dns_servers = ["10.2.50.12"]
        dns_domain = "nbl.lan"
        zone = "srv.nbl.lan"
        netmask = "24"
        network_bridge = "vmbr250"
        storage_volume = "vm-zfs1"
        cloud_user = "root"
        tags = []
        ssh_keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCYt5J+Qd7WY80XMBP/NQMzfEZqpu3V53Zm0fI7cWWY7Pjaqn3vG0VepU01KP/V6Qg6tdRZUgyKImrYMcFFxG5GREBmNqw6NnzYiZSw/Vut7CecqsoUvlkvU6fuKtMv1+onWn2o9W3+H1t6scBxOz2RT+tve7rBirtH43ObKs3FgViNLTO9ZS/evXno8vZ/fSP8liARL0ERH2WuPBsSe675/lAt/VowByoh2XNztsgKmkkGdEJzZdHsyr3ms9KLS9p9TCRwnJxwzxLph2ymM0L9Rf/BiuOg5sumkYqz5WJNdp+80RD1xazv5gp3koNxNGse1dBNhz25kbohIgbwMfWkyH7UaUJ9DrqXL3lvDaTyA0Hy0kBIiHrhYa1K/VqjxLic/gXEEiwp9A/g6zSWNDtjy6N0HgicmbhoxMeft0fX84eNFOTLx2kghCyV2w58bdwmHh26j553u91T6IbiR3eyRU+VJqrYLs+/GQUACbQIUrUKhBt5Coz9vDbsZSMib5GjpnAFAwHx0Cp0+AUXliPlSUz4UmZNf6trqHCW8DoJ39mscKLTo4r5WhnjxpkYhOjGUXu2LKNdqx3Of3ALfTCNPU4xY12PoDZ2Gxs7neOOckmyvW9f+qg7JkuPYsT1SgzHhB8J5dy5151zwl1VtO8YrzmDcNDhbN+uBYoUog2Wvw=="
        ]
        startup_order = 0
        cpu_type = "x86-64-v2-AES"
        role = 9
        started = true
    }

    vm_list = yamldecode(file("${path.module}/virtual_machines.yaml")).virtual_machines
    
    vm_merged = [
        for vm in local.vm_list : merge(
            local.vm_defaults,
            vm,
        )
    ]
    
    vm_map  = { for vm in local.vm_merged : vm.name => vm }
}