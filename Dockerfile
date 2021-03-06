FROM python:3.5.2

ENV APP_HOME /merchant
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME

RUN for folder in /merchant/*; do \
        if [ -d "${folder}" ];then \
            for file in $folder/*; do \
                if [ "${file}" != "${file%requirements.txt}" ];then \
                    echo "Installing dependencies from $file ..."; \
                    pip install -r $file; \
                fi \
            done \
        fi \
    done

CMD ["bash", "/merchant/start-merchant.sh"]
