c.Spawner.notebook_dir = '~/notebooks'
c.Authenticator.whitelist = {'tkm1988'}
c.Authenticator.admin_users = {'tkm1988'}
c.Spawner.args = ['--debug', '--profile=PHYS131']
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.NotebookApp.base_url = '/jupyter/'
c.NotebookApp.base_project_url = '/jupyter/'
c.NotebookApp.webapp_settings = {'static_url_prefix':'/jupyter/static/'}
c.Spawner.default_url = '/lab'
c.NotebookApp.kernel_spec_manager_class='environment_kernels.EnvironmentKernelSpecManager'
c.EnvironmentKernelSpecManager.env_dirs=['/opt/conda/envs']
