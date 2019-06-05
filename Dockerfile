FROM timbru31/java-node as builder
#RUN apt-get update && \
#apt-get -y install \
#git
#RUN git clone
COPY . ./angular-app
RUN pwd
WORKDIR angular-app
RUN npm install && \
npm run build

FROM nginx

#COPY ./config/nginx-custom.conf /etc/nginx/conf.d/default.conf
                                  
## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
#COPY --from=builder /ng-app/dist /usr/share/nginx/html