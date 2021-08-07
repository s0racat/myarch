FROM archlinux/archlinux:latest
CMD /sbin/init
RUN systemctl status

