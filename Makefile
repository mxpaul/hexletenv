ANSIBLE_ENVIRONMENT = PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false \
	ANSIBLE_SSH_ARGS="$(ANSIBLE_SSH_ARGS)"
ANSIBLE_SSH_ARGS = -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ControlMaster=auto \
	-o ControlPersist=60s
override ANSIBLE_PLAYBOOK_FLAGS += --connection=ssh --timeout=30 --limit="default"
ANSIBLE_VAGRANT_INVENTORY = .vagrant/provisioners/ansible/inventory

all:

.PHONY: ansible
ansible:
	$(ANSIBLE_ENVIRONMENT) ansible-playbook $(ANSIBLE_PLAYBOOK_FLAGS) \
		--inventory-file="$(ANSIBLE_VAGRANT_INVENTORY)" -v ansible/playbook.yml
