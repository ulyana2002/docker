FROM amazonlinux
COPY myscript.sh .
RUN chmod 775 myscript.sh
CMD ["./myscript.sh"]
