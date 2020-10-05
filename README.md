# devtools
Miscellaneous development tooling.

# TODO
Add noVNC image with:
```
FROM ...

RUN sed -i 's/^vncserver \$DISPLAY -depth/vncserver \$DISPLAY -localhost=no -depth/g' /dockerstartup/vnc_startup.sh

RUN sed -i 's/^    wait \$PID_SUB/    xhost \+ \&\& wait \$PID_SUB/g' /dockerstartup/vnc_startup.sh

USER 1000

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--wait"]

```
