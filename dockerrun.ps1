Param([string] $opt, [string]$background_opt, [string]$dryrun)

$container_param = ""
$mount_path      = @("-v C:\Users\Takuma\Project\Docker\SandBox\myJupyterHub\opt:/srv/jupyterhub", 
                     "-v C:\Users\Takuma\source\repos\jupyter_notebook:/home/tkm1988/notebooks"
                    )
$port_bind       = "-p 8080:8000"
$host_name       = "-h `"rtkmjh1f`""
$container_name  = "--name `"rtkmjh1f`""
$container_image = "myjupyterhub/myjupyterhub:latest"
$init_command    = "nohup jupyterhub --no-ssl --config=/opt/jupyterhub_config.py `"&`""
$startup_status  = ""
$exec_state      = ""

switch ($opt) {
    "rm" { 
        $startup_status = "--rm"
    }
    "permanet" {
        $startup_status = ""
    }
    "tty" {
        $startup_status = "--rm -it"
        $init_command   = "/bin/bash"
    }
    Default {
        $startup_status = "-rm"
    }
}

switch ($background_opt) {
    "foreground" { $exec_state = ""   }
    "background" { $exec_state = "-d" }
    Default      { $exec_state = ""   }
}

$container_param = " " + $startup_status + " "

foreach ($volume in $mount_path) {
    $container_param = $container_param + $volume + " "
}

$container_param = $container_param + $port_bind + " " `
                   + $host_name + " " `
                   + $container_name + " " `
                   + $exec_state + " " `
                   + $container_image + " " `
                   + $init_command

if ($dryrun -eq "dry-run") {
    echo ("docker container run " + $container_param)
} else {
    Invoke-Expression ("docker container run " +  $container_param)
}
