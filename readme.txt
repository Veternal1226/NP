�{���ϥ�:
	make���O:
	�n����fork��server�ɿ�J:
		make fork
	�n����select��server�ɿ�J:
		make select
	���ͪ��������ɦW��
		hw1_server_fork	�P	hw1_server_select
	����sudo ./hw1_server_fork��	(��hw1_server_select)
	�}��firefox�s���� ���}��Jlocalhost
	�e���L�Xindex.html���O�J��rem.jpg
�{�����e:
rem.jpg:�d�ҹϤ�
index.html:�u��ܹϤ�������
fork�Pselect�@�q�禡printpic(int fd):
	����http�q�T�öi��B�z�A���Jindex.html�A�N�Ϥ��ɶǦVclient
	�{�������ϥΨ�}�Y��extensions�P�_�ɮ׮榡�A�g�����ɧ��X�R��
hw1_server_fork:
	�P�ҥ��[�c�ۦP
	�}socket(port 80)
	bind
	listen
	�NSIGCHLD�欰�ɦV��sig_chld
	�j�餺�e:
		accept client�o��fd
		�z�Lfork�Nfd���child process����printpic
		child���������exit(0)�H����zombie process

hw1_server_select:
	�P�ҥ��[�c�ۦ�
	�}socket(port 80)
	bind
	listen
	��l��FD_SET�H�ϥ�select
	�j�餺�e:
		�Q��select��X��������fd
		�Y��readable�A�T�{set�٦��Ŷ���[�J
		�A��C�ӭn�D�Ϥ��ɪ�fd����printpic

�ѦҸ��:
hw1_server_fork�Ѧҽҥ��d�Ҥ���tcpcliserv/tcpserv09.c
hw1_server_select�Ѧҽҥ��d�Ҥ���tcpcliserv/tcpservselect01.c
HTTP�q�T�ѦҤFhttps://fred-zone.blogspot.com/2007/09/http-web-server.html