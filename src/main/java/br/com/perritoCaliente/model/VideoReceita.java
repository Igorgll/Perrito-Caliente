package br.com.perritoCaliente.model;

public class VideoReceita {

    private String idVideo;
    private String video;

    public VideoReceita(String video) {
        this.video = video;
    }

    public VideoReceita(String idVideo, String video) {
        this.idVideo = idVideo;
        this.video = video;
    }

    public String getIdVideo() {
        return idVideo;
    }

    public void setIdVideo(String idVideo) {
        this.idVideo = idVideo;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }
}
